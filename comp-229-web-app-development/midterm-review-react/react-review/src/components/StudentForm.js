import { useState } from "react";

function StudentForm(){
    // hooks
    // const [name, setName] = useState();
    // const [age, setAge] = useState();
    // const [country, setCountry] = useState();

    const [formData, setFormData] = useState({
        name: "",
        age: "",
        country: "",
        description: ""
    });


    function handleFormData(e) {
        const { name, value } = e.target;
        setFormData(
            { 
                ...formData, 
                [name]: value 
            }
        );
    }
    // function handleName(e) {
    //     setName(e.target.value);
    // }

    // function handleAge(e) {
    //     setAge(e.target.value);
    // }

    // function handleCountry(e) {
    //     setCountry(e.target.value);
    // }

    function submitForm(e) {
        e.preventDefault();
        console.log(formData);
        alert(`Form submited: ${formData.name}`)
    }

    return (
        <form>
            <h1>Student Application</h1>
            {/* <input name="name" onChange={handleName}/>
            // <input name="age" onChange={handleAge}/>
            <input name="country" onChange={handleCountry}/> */}
            <input name="name" onChange={handleFormData}/>
            <input name="age" onChange={handleFormData}/>
            <input name="country" onChange={handleFormData}/>
            <input name="description" onChange={handleFormData}/>
            <button onClick={ submitForm }>Submit</button>
        </form>
    )
}


export default StudentForm;