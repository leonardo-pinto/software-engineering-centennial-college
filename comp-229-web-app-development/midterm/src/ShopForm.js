import { useForm } from "react-hook-form"


export default function ShopForm() {
  const {
    register,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm()


  function onSubmit(data) {
    console.log("New Shop Form submitted successfully!")
    console.log(data);
  }

  function handleCancel(e) {
    e.preventDefault()
    console.log("Cancelling form submission...")
    reset();
  }

  return (
    <form>
      <h1>New Shop</h1>
      <input placeholder="Name" {...register("name", { required: true})} />
      {errors.name && <span>Name is required</span>}

      <input placeholder="Description "{...register("description", { required: true })} />
      {errors.description && <span>Description is required</span>}
    
      <div className="btn__wrapper">
        <button className="btn__submit" onClick={ handleSubmit(onSubmit) }>SUBMIT</button>
        <button onClick={ handleCancel }>CANCEL</button>
      </div>
    </form>
  )
}