<?php

namespace App\Http\Controllers;

use App\Models\Article;
use Illuminate\Http\Request;
use App\Http\Resources\ArticleItemResource;
use App\Http\Resources\ArticleSingleResource;
use App\Models\Category;
use App\Models\Tag;

class ArticleController extends Controller
{
    public $tags;
    public $categories;
    
    
    public function __construct()
    {
        $this->tags = TAG::select('id', 'name')->get();
        $this->categories = Category::select('id', 'name')->get();

        //Membuat pengecualian user pada halaman index dan show tanpa harus login
        $this->middleware('auth')->except('show', 'index');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $articles = Article::query()
            ->select('title', 'slug', 'user_id', 'teaser', 'created_at', 'id')
            ->with(['tags' => fn ($tag) => $tag->select('name', 'slug')])
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
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'picture' => ['nullable', 'mimes:png,jpg,jpeg', 'image'],
            'title' => ['required', 'string', 'min:3'],
            'teaser' => ['required', 'string', 'min:3'],
            'body' => ['required', 'string', 'min:3'],
            'category_id' => ['required', 'exists:categories,id'],
            'tags' => ['required', 'array'],
        ]);

        $picture = $request->file('picture');
        $article = $request->user()->articles()->create([
            'title' => $title = $request->title,
            'slug' => $slug = str($title)->slug(),
            'teaser' => $request->teaser,
            'category_id' => $request->category_id,
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Article $article)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function destroy(Article $article)
    {
        //
    }
}
