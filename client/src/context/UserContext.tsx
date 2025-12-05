import { createContext, useContext } from "react";
import type { UserSummary } from "../types/UserSummary.ts";

interface UserContextType {
  user: UserSummary | null;
  setUser: (user: UserSummary | null) => void;
}

export const UserContext = createContext<UserContextType>({
  user: null,
  setUser: () => {},
});

export const useUser = () => {
  const ctx = useContext(UserContext);

  if (!ctx) {
    throw new Error("UserContext must be used within a UserProvider");
  }

  return ctx;
};
