import { Amplify, type ResourcesConfig } from "aws-amplify";
import type { getAmplifyDataClientConfig } from "@aws-amplify/backend/function/runtime";

type DataClientConfig = Awaited<ReturnType<typeof getAmplifyDataClientConfig>>;

export function configureIamDataClient(
  resourceConfig: DataClientConfig["resourceConfig"],
  libraryOptions: DataClientConfig["libraryOptions"],
): void {
  // Amplify 6.22 skips custom credential providers when Auth is absent.
  // Lambda uses IAM, so enable Auth without configuring a Cognito pool.
  Amplify.configure(
    { ...resourceConfig, Auth: {} as ResourcesConfig["Auth"] },
    libraryOptions,
  );
}
