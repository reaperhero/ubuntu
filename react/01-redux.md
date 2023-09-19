什么情况下需要使用redux

某个组件的状态，需要让其他组件可以随时拿到（共享）
一个组件需要改变另一个组件的状态（通信）
总体原则：能不用就不用，如果不用比较吃力才用



## redux工作流程图
![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/26b98b1864624057838f6b2259c72ba5~tplv-k3u1fbpfcp-watermark.image?)

1) 用户发出 Action
```
store.dispatch(action);
```
2) Store 自动调用 Reducer
传入两个参数：当前 State 和收到的 Action。 Reducer 会返回新的 State 
```
let nextState = todoApp(previousState, action);
```
3) Store 调用监听函数

```
// 设置监听函数
function listerner() {
  let newState = store.getState();
  component.setState(newState);   
}

store.subscribe(listener);
```


- example

```
const Counter = ({ value, onIncrement, onDecrement }) => (
  <div>
  <h1>{value}</h1>
  <button onClick={onIncrement}>+</button>
  <button onClick={onDecrement}>-</button>
  </div>
);

const reducer = (state = 0, action) => {
  switch (action.type) {
    case 'INCREMENT': return state + 1;
    case 'DECREMENT': return state - 1;
    default: return state;
  }
};

const store = createStore(reducer);

const render = () => {
  ReactDOM.render(
    <Counter
      value={store.getState()}
      onIncrement={() => store.dispatch({type: 'INCREMENT'})}
      onDecrement={() => store.dispatch({type: 'DECREMENT'})}
    />,
    document.getElementById('root')
  );
};

render();
store.subscribe(render);
```