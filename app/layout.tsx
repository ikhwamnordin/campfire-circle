import type { Metadata } from "next";
import "./globals.css";
import "./additions.css";

export const metadata: Metadata = {
  title: "Campfire Circle — Group Camping Planner",
  description: "Discuss, vote, pack and split costs for your next camping trip.",
  icons: {
    icon: "/favicon.svg",
    shortcut: "/favicon.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en-AU">
      <body className="antialiased">{children}</body>
    </html>
  );
}
