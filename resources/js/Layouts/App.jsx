import React from "react";
import Navbar from "./Navbar";

export default function App({ children }) {
    return (
        <div>
            <Navbar />
            <div className="pt-8">{children}</div>
        </div>
    );
}
