import Container from "@/Components/Container";
import React from "react";
import App from "@/Layouts/App";
import { Link } from "@inertiajs/inertia-react";
import Pagination from "@/Components/Pagination";

export default function ArticleTable(props) {
    // data rename to articles
    const { data: articles, meta, links } = props.articles;
    return (
        <Container>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th>Tags</th>
                        </tr>
                    </thead>
                    <tbody>
                        {articles.length ? (
                            articles.map((article, i) => (
                                <tr key={article.id}>
                                    <td>{meta.from + i}</td>
                                    <td>
                                        <Link href={article.url}>
                                            {article.title}
                                        </Link>
                                    </td>
                                    <td>
                                        <Link href={article.category.url}>
                                            {article.category.name}
                                        </Link>
                                    </td>
                                    <td>
                                        {article.tags.map((tag, i) => (
                                            <Link href={tag.url} key={i}>
                                                {tag.name}
                                            </Link>
                                        ))}
                                    </td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <p>You don't have any article yet.</p>
                            </tr>
                        )}
                    </tbody>
                </table>
                <Pagination {...{ meta, links }} />
            </div>
        </Container>
    );
}

ArticleTable.layout = (page) => <App children={page} />;
