import { useForm } from "react-hook-form"


export default function ProductForm() {
  const {
    register,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm()


  function onSubmit(data) {
    console.log("New Product Form submitted successfully!")
    console.log(data);
  }

  function handleCancel(e) {
    e.preventDefault()
    console.log("Cancelling form submission...")
    reset()
  }

  return (
    <form>
      <h1>New Product</h1>
      <input placeholder="Name" {...register("name", { required: true})} />
      {errors.name && <span>Name is required</span>}

      <input placeholder="Description "{...register("description", { required: true })} />
      {errors.description && <span>Description is required</span>}

      <input placeholder="Category "{...register("category", { required: true })} />
      {errors.category && <span>Category is required</span>}

      <input 
        type="number" 
        placeholder="Quantity "{...register("quantity", { required: true, min: 1 })} />
      {errors.quantity && <span>Quantity should be greater than 0</span>}

      <input 
        type="number"
        placeholder="Price "{...register("price", { required: true, min: 0 })} />
      {errors.price && <span>Price should be a positive value</span>}
    
      <div className="btn__wrapper">
        <button className="btn__submit" onClick={ handleSubmit(onSubmit) }>SUBMIT</button>
        <button onClick={ handleCancel }>CANCEL</button>
      </div>
    </form>
  )
}