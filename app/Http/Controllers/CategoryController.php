<?php

namespace App\Http\Controllers;

use App\Http\Resources\ArticleItemResource;
use App\Models\Category;
use App\Models\Article;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function show(Category $category)
    {
        $articles = Article::query()
            ->select('title', 'picture', 'slug', 'user_id', 'teaser', 'created_at', 'id')
            ->with(['tags' => fn ($tag) => $tag->select('name', 'slug')])
            ->latest()
            ->fastPaginate(10);
        
        return inertia('Categories/Show', [
            'category' => $category,
            'articles' => ArticleItemResource::collection($articles)
        ]);
    }
}
