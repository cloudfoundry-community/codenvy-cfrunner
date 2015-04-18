# codenvy-cfrunner
Cloud Foundry runner for the cloud-ide [Codenvy](https://codenvy.com/).

[Codenvy](https://codenvy.com/) let you code directly in your browser and in add provide a way to execute your current code directly online with docker container. see this 3min video: [Creating Java Apps With Eclipse Che](https://www.youtube.com/watch?v=Hfa7IJONJPU) to see the magic.

But there is no runner for cloud foundry this repo let you use Cloud Foundry as a runner and show log from Cloud Foundry.

## Installation
 1. Create a account on [Codenvy](https://codenvy.com/site/create-account)
 2. Create or import a project in your dashboard
 3. Create a `manifest.yml` on your root directory project in codenvy (see: [http://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html](http://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html) )
 3. In your environment click on bottom on the tab `runner`. The runner tab will appear.
 4. Choose the tab `Configs` from it
 5. You will see 2 option list: `Type` and `Scope`, on `Scope`choose all and it will show you a list of provided runner.
 6. In this list choose one and click on `copy` on the right you will have a new custom runner wich start by `Environment`
 7. Select this new runner and replace the text area called `Dockerfile` by this content [https://github.com/cloudfoundry-community/codenvy-cfrunner/blob/master/Dockerfile](https://github.com/cloudfoundry-community/codenvy-cfrunner/blob/master/Dockerfile) and replace at the beggining of the file your cloud foundry api url, your cloud foundry login...
 8. Click on `Save`
 9. Run it by clicking on the play icon
 10. Your app will be pushed, logs will be tailed and codenvy will provide you an url which will redirect to your current running app on Cloud Foundry

**Note:** You can ask help on issues if some points are not very clear.
