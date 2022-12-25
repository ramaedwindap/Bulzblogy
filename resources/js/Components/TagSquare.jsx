import React from "react";
import { Link } from "@inertiajs/inertia-react";

export default function TagSquare({ children, ...props }) {
    return (
        <div>
            <Link
                className="bg-gray-700 text-white px-2 py-1 text-xs font-medium hover:bg-gray-600 transition duration-200 rounded shadow border-t border-gray-600"
                {...props}
            >
                {children}
            </Link>
        </div>
    );
}
