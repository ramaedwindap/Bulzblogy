import { Head } from "@inertiajs/inertia-react";
import App from "@/Layouts/App";
import React from "react";
import Header from "@/Components/Header";
import Container from "@/Components/Container";

export default function Show({ article }) {
    return (
        <div>
            <Head title={article.title} />
            <Header>
                <Header.Title>{article.title}</Header.Title>
                <Header.Subtitle>{article.teaser}</Header.Subtitle>
            </Header>
            <Container>{article.body}</Container>
        </div>
    );
}

Show.layout = (page) => <App children={page} />;
