import { BrowserRouter, Route, Routes } from "react-router-dom";
import { LoginPage } from "./pages/LoginPage.tsx";
import { DashboardPage } from "./pages/DashboardPage.tsx";
import { NotFoundPage } from "./pages/NotFoundPage.tsx";
import { Theme } from "@radix-ui/themes";
import { AppLayout } from "./layout/AppLayout.tsx";

function App() {
  return (
    <Theme accentColor="jade" appearance="dark">
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<LoginPage />} />
          <Route
            path="/dashboard"
            element={
              <AppLayout>
                <DashboardPage />
              </AppLayout>
            }
          />
          <Route path="*" element={<NotFoundPage />} />
        </Routes>
      </BrowserRouter>
    </Theme>
  );
}

export default App;
