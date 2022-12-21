import { useEffect, React } from "react";
import hljs from "highlight.js";
import { marked } from "marked";

export default function Markdown({ children }) {
    useEffect(() => {
        hljs.highlightAll();
    }, []);
    return (
        <div
            className="prose max-w-none prose-code:rounded-lg prose-img:rounded-lg"
            dangerouslySetInnerHTML={{ __html: marked(children) }}
        />
    );
}
