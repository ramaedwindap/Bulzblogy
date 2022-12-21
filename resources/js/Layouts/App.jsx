import React from "react";
import Footer from "./Footer";
import Navigation from "./Navigation";

export default function App({ children }) {
    return (
        <div>
            <Navigation />
            <div className="pt-8">{children}</div>
            <Footer />
        </div>
    );
}
