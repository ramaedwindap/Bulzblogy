import { Head, Link } from "@inertiajs/inertia-react";
import App from "@/Layouts/App";
import React from "react";
import Header from "@/Components/Header";
import Container from "@/Components/Container";
import Markdown from "@/Components/Markdown";
import TagSquare from "@/Components/TagSquare";

export default function Show({ article }) {
    return (
        <div>
            <Head title={article.title} />
            <Header>
                <div className="mb-4">
                    <div className="text-gray-400 text-sm mb-4">
                        Fill in:{" "}
                        <Link
                            className="text-white underline"
                            href={route(
                                "categories.show",
                                article.category.slug
                            )}
                        >
                            {article.category.name}
                        </Link>
                    </div>

                    {article.tags.length ? (
                        <div className="flex items-center gap-x-2 mb-1">
                            {article.tags.map((tag) => (
                                <TagSquare key={tag.slug}>{tag.name}</TagSquare>
                            ))}
                        </div>
                    ) : null}
                </div>
                <Header.Title>{article.title}</Header.Title>
                <Header.Subtitle>{article.teaser}</Header.Subtitle>
            </Header>
            <Container>
                <div className="max-w-full grid grid-cols-12 gap-16">
                    <div className="col-span-9">
                        <Markdown>{article.body}</Markdown>
                    </div>
                    <div className="col-span-3">Lorem testing aje</div>
                </div>
            </Container>
        </div>
    );
}

Show.layout = (page) => <App children={page} />;
