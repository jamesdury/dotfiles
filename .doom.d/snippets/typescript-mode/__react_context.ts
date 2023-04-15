import reducer from "@/components/context/reducer";
import {
  createContext,
  Dispatch,
  ReactNode,
  useContext,
  useReducer,
} from "react";

export const initialState: State = {
  isDark: false,
};

const GlobalContext = createContext<{
  state: State;
  dispatch: Dispatch<Action>;
}>({
  state: initialState,
  dispatch: () => {},
});

export const GlobalContextProvider = ({ children }: {
  children: ReactNode;
}) => {
  const [state, dispatch] = useReducer(reducer, initialState);
  return (
    <GlobalContext.Provider
      value={{
        state,
        dispatch,
      }}
    >
      {children}
    </GlobalContext.Provider>
  );
};

// Custom context hook
export const useGlobalContext: ContextHook = () => {
  const { state, dispatch } = useContext(GlobalContext);
  return { state, dispatch };
};
