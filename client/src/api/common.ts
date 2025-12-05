import axios from "axios";

export const env = {
  API_URL: import.meta.env.VITE_API_BASE_URL,
};

export const api = axios.create({
  baseURL: env.API_URL,
  withCredentials: true,
});
