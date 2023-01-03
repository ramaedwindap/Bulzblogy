<?php
namespace App\Enums;

enum ArticleStatus: int
{
    case UNPUBLISHED = 0;
    case PREVIEW = 1;
    case PUBLISHED = 2;
}
