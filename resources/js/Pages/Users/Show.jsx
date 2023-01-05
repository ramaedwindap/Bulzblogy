import ArticleBlock from "@/Components/ArticleBlock";
import Container from "@/Components/Container";
import Grid from "@/Components/Grid";
import Header from "@/Components/Header";
import Pagination from "@/Components/Pagination";
import App from "@/Layouts/App";
import { Head } from "@inertiajs/inertia-react";
import React from "react";

export default function Show({ user, ...props }) {
    const { data: articles, meta, links } = props.articles;
    return (
        <div>
            <Head title={`${user.name}`} />

            <Header>
                <Header.Title>{user.name}</Header.Title>
                <Header.Subtitle>Joined {user.joined}</Header.Subtitle>
            </Header>

            <Container>
                {articles.length ? (
                    <>
                        <Grid>
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
