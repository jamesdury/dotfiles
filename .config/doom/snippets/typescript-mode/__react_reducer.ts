const reducer: ReducerType = (state, action) => {
  switch (action.type) {
    case "ON":
      return { ...state, isDark: true };
    case "OFF":
      return { ...state, isDark: false };
    default:
      return state;
  }
};

export default reducer;
