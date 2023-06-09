```mermaid
graph TD
d[deployment] -->|has multiple| p[pod]
d -->|references| se[service]
d -->|references| sec[secret]
d -->|references| cm[config map]
```

next up config map