{
    kind: 'List',
    items: [
        {
            kind: 'Pod',
            metadata: {
                name: 'example-app-jsonnet',
                labels: {
                    app: 'example-app-jsonnet',
                },
            },
            spec: {
                containers: [
                    {
                        name: 'nginx',
                        image: 'nginx:latest',
                        ports: [
                            {
                                containerPort: 80,
                            },
                        ],
                    },
                ],
            },
        },
        {
            kind: 'Service',
            metadata: {
                name: 'example-app-jsonnet',
            },
            spec: {
                type: 'NodePort',
                selector: {
                    app: 'example-app-jsonnet',
                },
                ports: [
                    {
                        protocol: 'TCP',
                        port: 80,
                        targetPort: 80,
                    },
                ],
            },
        },
        {
            kind: 'HTTPRoute',
            metadata: {
                name: 'example-app-jsonnet',
            },
            spec: {
                parentRefs: [
                    {
                        name: 'nginx-gateway-fabric',
                        sectionName: 'http',
                    },
                ],
                rules: [
                    {
                        matches: [
                            {
                                headers: [
                                    {
                                        name: 'host',
                                        value: 'example-app-jsonnet.127.0.0.1.nip.io',
                                    },
                                ],
                            },
                        ],
                        backendRefs: [
                            {
                                name: 'example-app-jsonnet',
                                port: 80,
                            },
                        ],
                    },
                ],
            },
        },
    ],
}
