local name = 'test-app';
local labels = { app: name };
local port = 8080;
local image = std.extVar('image');

[
  {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: { name: name, labels: labels },
    spec: {
      selector: { matchLabels: labels },
      template: {
        metadata: { labels: labels },
        spec: {
          containers: [
            {
              name: name,
              image: image,
              ports: [
                { containerPort: port },
              ],
            },
          ],
        },
      },
    },
  },
  {
    apiVersion: 'v1',
    kind: 'Service',
    metadata: { name: name, labels: labels },
    spec: {
      selector: labels,
      ports: [
        { port: port },
      ],
    },
  },
]
