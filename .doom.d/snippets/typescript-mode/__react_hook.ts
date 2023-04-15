/**
const [ data, error, loading, fetchData ] = useAxiosFetch({
  method: "GET",
  url: "/tutorials",
  params: {
    title: searchTitle,
  },
});

const onSomething = () => {
  fetchData();
}
*/
import { useState } from "react";

import axios, { AxiosRequestConfig } from "axios";

axios.defaults.baseURL = "http://localhost:8080/api";

export const useAxiosFetch = (params: AxiosRequestConfig<any>) => {
  const [data, setData] = useState<any>(null);

  const [error, setError] = useState<any>(null);
  const [loading, setLoading] = useState<boolean>(true);

  const fetchData = async (): Promise<void> => {
    try {
      const response = await axios.request(params);
      setData(response.data);
    } catch (error) {
      if (axios.isAxiosError(error)) {
        setError("Axios Error with Message: " + error.message);
      } else {
        setError(error);
      }
      setLoading(false);
    } finally {
      setLoading(false);
    }
  };

  return [data, error, loading, fetchData] as const;
};
