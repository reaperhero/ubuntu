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

## react-redux

> 为了方便使用，Redux 的作者封装了一个 React 专用的库 React-Redux

`React-Redux` 将所有组件分成两大类：`UI组件`（presentational component）和`容器组件`（container component）

`UI组件`有以下几个特征。
- 只负责UI的呈现，不带有任何业务逻辑
- 没有状态（即不使用`this.state`这个变量）
- 所有数据都由参数（`this.props`）提供
- 不使用任何 `Redux` 的 `API`

`容器组件`的特征恰恰相反
- 负责管理数据和业务逻辑，不负责UI的呈现
- 带有内部状态
- 使用 `Redux` 的 `API`

总结：
`UI组件`负责UI的呈现，`容器组件`负责管理数据和逻辑，如果一个组件既有UI又有业务逻辑，将它拆分成下面的结构：外面是一个容器组件，里面包了一个UI 组件。前者负责与外部的通信，将数据传给后者，由后者渲染出视图


- 所有的UI组件都应该包裹一个容器组件，它们是父子关系
- 容器组件是真正与redux打交道的，里面可以随意调用redux的API
- UI组件中不能使用任何redux API
- 容器组件通过props给UI组件传递（1）redux中所保存的状态（2）用于操作状态的方法