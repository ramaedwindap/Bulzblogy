import { Head } from "@inertiajs/inertia-react";
import App from "@/Layouts/App";
import React from "react";
import Header from "@/Components/Header";
import Container from "@/Components/Container";
import Markdown from "@/Components/Markdown";

export default function Show({ article }) {
    return (
        <div>
            <Head title={article.title} />
            <Header>
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
