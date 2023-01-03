<?php

namespace App\Http\Controllers;

use App\Enums\ArticleStatus;
use App\Http\Requests\ArticleRequest;
use App\Models\Article;
use Illuminate\Http\Request;
use App\Http\Resources\ArticleItemResource;
use App\Http\Resources\ArticleSingleResource;
use App\Http\Resources\ArticleTableResource;
use App\Models\Category;
use App\Models\Tag;
use Illuminate\Support\Facades\Storage;

class ArticleController extends Controller
{
    public $tags;
    public $categories;
    public $statuses;
    
    
    public function __construct()
    {
        $this->middleware('hasRole')->only('table', 'create');
        $this->tags = TAG::select('id', 'name')->get();
        $this->categories = Category::select('id', 'name')->get();

        $this->statuses = collect(ArticleStatus::cases())->map(fn ($status) => [
            'id' => $status->value,
            'name' => str($status->label())->ucfirst(),
        ]);

        //Membuat pengecualian user pada halaman index dan show tanpa harus login
        $this->middleware('auth')->except('show', 'index');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function table(Request $request)
    {
        $articles = Article::query()
                    ->with([
                        'author',
                        //membuat kondisional
                        'tags' => fn ($query) => $query->select('name', 'slug', 'id'),
                        'category' => fn ($query) => $query->select('name', 'slug', 'id'),
                    ])
                    ->whereBelongsTo($request->user(), 'author') // mempunyai relasi dengan tabel user, buat inisialiasi 'author'
                    ->latest()
                    ->fastPaginate(10);
                    
        return inertia('Articles/Table', [
            'articles' => ArticleTableResource::collection($articles),
        ]);
    }

    public function index()
    {
        $articles = Article::query()
            ->select('title', 'slug', 'user_id', 'teaser', 'created_at', 'id')
            ->with(['tags' => fn ($tag) => $tag->select('name', 'slug')])
            ->wherePublished()
            ->latest()
            ->fastPaginate(10);

        return inertia('Articles/Index', [
            'articles' => ArticleItemResource::collection($articles)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return inertia('Articles/Create', [
            'tags' => $this->tags,
            'categories' => $this->categories,
            'statuses' => $this->statuses,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ArticleRequest $request)
    {
        $picture = $request->file('picture');
        $article = $request->user()->articles()->create([
            'title' => $title = $request->title,
            'slug' => $slug = str($title)->slug(),
            'teaser' => $request->teaser,
            'category_id' => $request->category_id,
            'status' => $request->status,
            'body' => $request->body,
            'picture' => $request->hasFile('picture') ? $picture->storeAs('images/articles', $slug .'.'. $picture->extension()) : null,

        ]);

        $article->tags()->attach($request->tags);

        return to_route('articles.show', $article);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function show(Article $article)
    {   
        // return new ArticleSingleResource($article);
        $articles = Article::query()
            ->select('id', 'title', 'slug')
            ->whereNot('id', $article->id)
            ->whereBelongsTo($article->category)
            ->limit(10)
            ->get();

        $currentArticle = $article->load([
                'tags' => fn ($query) => $query->select('name', 'slug'),
                'category' => fn ($query) => $query->select('id', 'name', 'slug')
        ]);

        return inertia('Articles/Show', [
            'articles' => $articles,
            'article' => (new ArticleSingleResource($currentArticle))->additional([
                'related' => $articles,
            ]),
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function edit(Article $article)
    {
        return inertia('Articles/Edit', [
            'article' => $article->load([
                'tags' => fn ($query) => $query->select('id', 'name'),
                'category' => fn ($query) => $query->select('id', 'name'),
            ]),
            'statuses' => $this->statuses,
            'tags' => $this->tags,
            'categories' => $this->categories,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function update(ArticleRequest $request, Article $article)
    {
        $picture = $request->file('picture');
        $article->update([
            'title' => $request->title,
            'teaser' => $request->teaser,
            'category_id' => $request->category_id,
            'body' => $request->body,
            'status' => $request->status,
            'picture' => $request->hasFile('picture') ? $picture->storeAs('images/articles', $article->slug .'.'. $picture->extension()) : $article->picture,
        ]);

        $article->tags()->sync($request->tags, true);

        return to_route('articles.show', $article);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function destroy(Article $article)
    {
        // dd($article->id); //cek id artikel
        if ($article->picture) {
            Storage::delete($article->picture);
        }
        $article->tags()->detach();
        $article->delete();
    }
}
