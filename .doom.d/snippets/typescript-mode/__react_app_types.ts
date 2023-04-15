interface State {
  isDark: boolean;
}

type ActionTypes = "ON" | "OFF";

interface Action {
  type: ActionTypes;
  payload?: any;
}

type ReducerType = (state: State, action: Action) => State;

type ContextHook = () => {
  state: State;
  dispatch: (action: Action) => void;
};
