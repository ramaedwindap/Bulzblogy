import { Head } from "@inertiajs/inertia-react";
import App from "@/Layouts/App";
import React from "react";
import Header from "@/Components/Header";
import Container from "@/Components/Container";
import Grid from "@/Components/Grid";
import ArticleBlock from "@/Components/ArticleBlock";
import Pagination from "@/Components/Pagination";

export default function Show({ tag, ...props }) {
    const { data: articles, meta, links } = props.articles;
    return (
        <div>
            <Head title={tag.name} />
            <Header>
                <Header.Title>{tag.name}</Header.Title>
                <Header.Subtitle>
                    This page will show you the articles about {tag.name}
                </Header.Subtitle>
            </Header>
            <Container>
                {articles.length ? (
                    <>
                        <Grid className="items-start">
                            {articles.map((article) => (
                                <ArticleBlock
                                    article={article}
                                    key={article.slug}
                                />
                            ))}
                        </Grid>
                        <Pagination {...{ meta, links }} />
                    </>
                ) : (
                    <p>No articles</p>
                )}
            </Container>
        </div>
    );
}

Show.layout = (page) => <App children={page} />;
