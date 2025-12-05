import { type ReactNode, useState } from "react";
import type { UserSummary } from "../types/UserSummary.ts";
import { UserContext } from "./UserContext.tsx";

export const UserProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<UserSummary | null>(null);

  const value = { user, setUser };

  return <UserContext.Provider value={value}>{children}</UserContext.Provider>;
};
