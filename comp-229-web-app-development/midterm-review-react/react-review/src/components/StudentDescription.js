function StudentDescription(props) {
    const { name, age, clickMe } = props;

    function buttonClicked() {
        clickMe(name)
    }

    return (
        <>
            <h1>{name}</h1>
            <p>{age}</p>
            <button onClick={buttonClicked}>Click me</button>
        </>
    )
}

export default StudentDescription;