import { Head, useForm } from "@inertiajs/inertia-react";
import App from "@/Layouts/App";
import { React } from "react";
import Header from "@/Components/Header";
import Container from "@/Components/Container";
import Input from "@/Components/input";
import InputLabel from "@/Components/InputLabel";
import InputFile from "@/Components/InputFile";
import Editor from "@/Components/Editor";
import Textarea from "@/Components/Textarea";
import PrimaryButton from "@/Components/PrimaryButton";
import Select from "@/Components/Select";
import MultipleSelect from "@/Components/MultipleSelect";
import { Inertia } from "@inertiajs/inertia";

export default function Create({ tags, categories }) {
    const { data, setData, post, errors } = useForm({
        title: "",
        teaser: "",
        category_id: "",
        body: "",
        picture: "",
        tags: [tags[0], tags[1]],
    });

    const onChange = (e) => setData(e.target.name, e.target.value);

    const onSubmit = (e) => {
        e.preventDefault();

        Inertia.post(route("articles.store"), {
            ...data,
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
                    <div className="mb-6">
                        <InputLabel forInput="picture" value="Picture" />
                        <InputFile
                            name="picture"
                            id="picture"
                            onChange={(e) =>
                                setData("picture", e.target.files[0])
                            }
                        />
                    </div>

                    <div className="grid grid-cols-12 gap-6 mb-6">
                        <div className="col-span-4">
                            <div>
                                <InputLabel forInput={"category_id"}>
                                    Category
                                </InputLabel>
                                <Select
                                    value={data.category_id}
                                    data={categories}
                                    onChange={(e) => setData("category_id", e)}
                                />
                            </div>
                        </div>

                        <div className="col-span-8">
                            <div>
                                <InputLabel forInput={"tags"}>Tags</InputLabel>
                                <MultipleSelect
                                    selectedItem={data.tags}
                                    data={tags}
                                    onChange={(e) => setData("tags", e)}
                                />
                            </div>
                        </div>
                    </div>

                    <div className="mb-6">
                        <InputLabel forInput="title" value="Title" />
                        <Input
                            name="title"
                            id="title"
                            onChange={onChange}
                            value={data.title}
                        />
                    </div>

                    <div className="mb-6">
                        <InputLabel forInput="teaser" value="Teaser" />
                        <Textarea
                            name="teaser"
                            id="teaser"
                            onChange={onChange}
                            value={data.teaser}
                        />
                    </div>

                    <div className="mb-6">
                        <Editor
                            name="body"
                            id="body"
                            onChange={onChange}
                            value={data.body}
                        />
                    </div>
                    <PrimaryButton>Create</PrimaryButton>
                </form>
            </Container>
        </div>
    );
}

Create.layout = (page) => <App children={page} />;
