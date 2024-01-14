import { useContext } from 'react';
import { CountContext } from '../App';
export default function Component3() {
  const count = useContext(CountContext);
  return <>Value: {count}</>
}
