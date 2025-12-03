import { Flex, Heading, Text } from "@radix-ui/themes";

export function NotFoundPage() {
  return (
    <Flex height="100vh" direction="column" align="center" justify="center">
      <Heading>Page not found</Heading>
      <Text>The page you are looking for does not exist.</Text>
    </Flex>
  );
}
