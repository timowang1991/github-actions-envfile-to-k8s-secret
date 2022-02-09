# What is this?

* Based on [TelluIoT / kubernetes-env-to-secrets](https://github.com/TelluIoT/kubernetes-env-to-secrets),
we make it into a github action.

* We are converting base64-encoded `.env` file stored in github secret into kubernetes ConfigMap or Secret yaml file

<br/><br/>

# How to use with github action?

* Create an `.env` file with the following content
```
NODE_ENV=prod

USERNAME=myusername
PASSWORD=mypassword
```

* Encode `.env`
```
cat .env | base64

Tk9ERV9FTlY9cHJvZAoKVVNFUk5BTUU9bXl1c2VybmFtZQpQQVNTV09SRD1teXBhc3N3b3Jk
```

* Put the base64-encoded string in github secret
![FireShot Capture 024 - Actions secrets - github com](https://user-images.githubusercontent.com/5511042/153199452-4d0d4ffa-8fba-4b57-b051-205282e5c6b1.png)
![FireShot Capture 025 - Actions secrets - github com](https://user-images.githubusercontent.com/5511042/153199517-9c047fb6-4aa2-4ca8-ac05-ab6c0b503027.png)

* Create `.github/workflows/main.yml` file. Below is only the snippet of it, see the full file [here](https://github.com/timowang1991/github-actions-envfile-to-k8s-object/blob/main/.github/workflows/main.yml)
```yaml
jobs:
  test:
    ...

    steps:
      ...
      
      - id: 'generateConfigMap'
        name: Generate ConfigMap
        uses: timowang1991/github-actions-envfile-to-k8s-object@v1
        with:
          k8sName: 'test-configmap'
          k8sKind: 'ConfigMap' # or 'Secret'
          base64EncodedEnvString: ${{ secrets.ENV }}
      
      - name: Check ConfigMap
        run: echo "${{ steps.generateConfigMap.outputs.k8sObject }}"
```

* you should get the following with `echo "${{ steps.generateConfigMap.outputs.k8sObject }}"`
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: test-configmap
type: Opaque
data:
  NODE_ENV: cHJvZA==
  USERNAME: bXl1c2VybmFtZQ==
  PASSWORD: bXlwYXNzd29yZA==
```