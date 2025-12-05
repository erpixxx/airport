import type { UserSummary } from "../types/UserSummary.ts";
import type { UserCredentials } from "../types/UserCredentials.ts";
import { api } from "./common.ts";

export const authenticate = async (
  credentials: UserCredentials,
): Promise<UserSummary> => {
  const res = await api.post(`/users/authenticate`, credentials);
  return res.data;
};
