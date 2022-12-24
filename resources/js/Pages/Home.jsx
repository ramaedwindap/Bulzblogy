import React from "react";
import App from "@/Layouts/App";
import { Head, Link } from "@inertiajs/inertia-react";
import Header from "@/Components/Header";
import Container from "@/Components/Container";
import ArticleBlock from "@/Components/ArticleBlock";
import Grid from "@/Components/Grid";

export default function Home({ articles }) {
    return (
        <div>
            <Head title="What's happening..." />
            <Header>
                <Header.Title>
                    Supreme court blocks Biden from lifting Covid-era border
                    restrictions
                </Header.Title>
                <Header.Subtitle>
                    Roberts temporarily halts effort to end Title 42 after 19
                    Republican states ask court to act
                </Header.Subtitle>
                <Header.Content>
                    The US supreme court on Monday said Covid-era restrictions
                    at the US-Mexico border that were set to end on Wednesday
                    should stay in place, at least temporarily, as a Republican
                    legal challenge moves forward.
                </Header.Content>
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
                        <Link
                            className="text-blue-600 block mt-10"
                            href={route("articles.index")}
                        >
                            Show more articles
                        </Link>
                    </>
                ) : (
                    <p>No articles</p>
                )}
            </Container>
        </div>
    );
}

Home.layout = (page) => <App children={page} />;
