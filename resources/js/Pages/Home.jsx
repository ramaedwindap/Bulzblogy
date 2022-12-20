import React from "react";
import App from "@/Layouts/App";
import { Head } from "@inertiajs/inertia-react";
import Header from "@/Components/Header";

export default function Home() {
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
        </div>
    );
}

Home.layout = (page) => <App children={page} />;
