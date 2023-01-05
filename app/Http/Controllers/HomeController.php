<?php

namespace App\Http\Controllers;

use App\Http\Resources\ArticleItemResource;
use App\Models\Article;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        // auth()->loginUsingId(3); // paksa login user
        // dd($request->user()->hasRole());
        // dd($request->user()->has('roles')->exists()); //check apakah user memiliki roles (cara 1) menggunakan collection
        // dd($request->user()->roles()->count()); //check apakah user memiliki roles (cara 2) menjadi builder
        $articles = Article::query()
            ->select('title', 'picture', 'slug', 'user_id', 'teaser', 'created_at', 'id')
            ->wherePublished()
            ->limit(5)
            ->get();
            
        return inertia('Home', [
            'articles' => ArticleItemResource::collection($articles),
        ]);
    }
}
