export default function InputLabel({ forInput, value, className, children }) {
    return (
        <label
            htmlFor={forInput}
            className={
                `block capitalize font-medium mb-2 text-sm text-gray-700 ` +
                className
            }
        >
            {value ? value : children}
        </label>
    );
}
