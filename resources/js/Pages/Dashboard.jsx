import { Head } from "@inertiajs/inertia-react";
import App from "@/Layouts/App";
import React from "react";
import Container from "@/Components/Container";

export default function Dashboard(props) {
    return (
        <>
            <Head title="Dashboard" />

            <Container>Dashboard</Container>
        </>
    );
}

Dashboard.layout = (page) => <App children={page} />;
