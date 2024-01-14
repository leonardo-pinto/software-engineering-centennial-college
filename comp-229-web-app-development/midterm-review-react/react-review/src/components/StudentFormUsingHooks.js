import { useForm } from "react-hook-form"

export default function StudentFormUsingHooks() {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm()

  const onSubmit = (data) => console.log(data)


  return (
    /* "handleSubmit" will validate your inputs before invoking "onSubmit" */
    <form onSubmit={handleSubmit(onSubmit)}>
      {/* register your input into the hook by invoking the "register" function */}
      <input {...register("name", {required: true})} />
      { errors.name && <span>Name field is required</span> }

      {/* include validation with required or other standard HTML validation rules */}
      <input {...register("age", { required: true })} />
      {/* errors will return when field validation fails  */}
      { errors.age && <span>Age field is required</span> }

      <input type="submit" />
    </form>
  )
}