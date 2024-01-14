import './App.css';
// import StudentDescription from './components/StudentDescription';
import StudentForm from './components/StudentForm';
import StudentFormUsingHooks from './components/StudentFormUsingHooks';

export function App() {

  const students = [
    {
      name: "Leonardo",
      age: 30
    },
    {
      name: "Pouya",
      age: 30
    },
    {
      name: "Amell",
      age: 30
    },
  ]

  // function iWasClickedInChildComponent(name) {
  //   console.log(`${name} clicked me in the child component`)
  // }

  return (
    // Fragment
    <> 
    <StudentFormUsingHooks />
    <StudentForm/>
      <h1>React Application</h1>
      <button>My Button</button>
      {
        students.map((student, index) => {
          return (
              <StudentDescription clickMe={iWasClickedInChildComponent} key={index} name={student.name} age={student.age} />
            )
        })
      }
      {/* <StudentDescription name={students[0].name} age={students[0].age}/>
      <StudentDescription name={students[1].name} age={students[1].age}/>
      <StudentDescription name={students[2].name} age={students[2].age}/> */}
    </>
  );
}

export default App;
