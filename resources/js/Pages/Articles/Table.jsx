import Container from "@/Components/Container";
import React from "react";
import App from "@/Layouts/App";
import { Link } from "@inertiajs/inertia-react";
import Pagination from "@/Components/Pagination";
import Table from "@/Components/Table";

export default function ArticleTable(props) {
    // data rename to articles
    const { data: articles, meta, links } = props.articles;
    return (
        <Container>
            <div>
                <Table>
                    <Table.Thead>
                        <tr>
                            <Table.Th>#</Table.Th>
                            <Table.Th>Title</Table.Th>
                            <Table.Th>Category</Table.Th>
                            <Table.Th>Tags</Table.Th>
                            <th></th>
                        </tr>
                    </Table.Thead>
                    <Table.Tbody>
                        {articles.length ? (
                            articles.map((article, i) => (
                                <tr key={article.id}>
                                    <Table.Td>{meta.from + i}</Table.Td>
                                    <Table.Td>
                                        <Link href={article.url}>
                                            {article.title}
                                        </Link>
                                    </Table.Td>
                                    <Table.Td>
                                        <Link href={article.category.url}>
                                            {article.category.name}
                                        </Link>
                                    </Table.Td>
                                    <Table.Td>
                                        {article.tags.map((tag, i) => (
                                            <Link href={tag.url} key={i}>
                                                {tag.name}
                                            </Link>
                                        ))}
                                    </Table.Td>
                                    <td>
                                        <Table.Dropdown>
                                            <Table.DropdownItem href={"#"}>
                                                View
                                            </Table.DropdownItem>
                                            <Table.DropdownItem href={"#"}>
                                                Edit
                                            </Table.DropdownItem>
                                            <Table.DropdownItem
                                                className="hover:bg-rose-50 hover:text-rose-500"
                                                href={"#"}
                                            >
                                                Delete
                                            </Table.DropdownItem>
                                        </Table.Dropdown>
                                    </td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <p>You don't have any article yet.</p>
                            </tr>
                        )}
                    </Table.Tbody>
                </Table>
                <Pagination {...{ meta, links }} />
            </div>
        </Container>
    );
}

ArticleTable.layout = (page) => <App children={page} />;
