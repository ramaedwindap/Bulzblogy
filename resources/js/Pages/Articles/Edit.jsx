import { Head, useForm } from "@inertiajs/inertia-react";
import App from "@/Layouts/App";
import { React } from "react";
import Header from "@/Components/Header";
import Container from "@/Components/Container";
import PrimaryButton from "@/Components/PrimaryButton";
import { Inertia } from "@inertiajs/inertia";
import ArticleForm from "@/Components/ArticleForm";

export default function Edit({ article, tags }) {
    const { data, setData } = useForm({
        title: article.title,
        teaser: article.teaser,
        category_id: article.category,
        body: article.body,
        picture: "",
        tags: article.tags,
    });

    const onSubmit = (e) => {
        e.preventDefault();

        Inertia.post(route("articles.update", article.slug), {
            ...data,
            _method: "PUT",
            category_id: data.category_id.id,
            tags: data.tags.map((t) => t.id),
        });
        //Menampilkan data (testing)
        // console.log(data);
    };

    return (
        <div>
            <Head title="Create new article" />
            <Header>
                <Header.Title>{data.title || "The title.."}</Header.Title>
                <Header.Subtitle>
                    {data.teaser || "The teaser.."}
                </Header.Subtitle>
            </Header>
            <Container>
                <form onSubmit={onSubmit}>
                    <ArticleForm {...{ data, setData }} />
                    <PrimaryButton>Create</PrimaryButton>
                </form>
            </Container>
        </div>
    );
}

Edit.layout = (page) => <App children={page} />;
