
# You cannot create a session collection and an error occurs in Windows Server 2012

## Symptoms  

Imagine this situation:

You activate one of the listed Group Policy configurations on a Windows Server 2012 server:

Enforce user authentication for remote connections via Network Level Authentication
Define client connection encryption level
Specify Remote Desktop license servers to use
You establish a session-based desktop deployment.

However, in this setup, the session collection deployment encounters failure with an "Unable to create the session collection" error. Furthermore, any ongoing creation of RemoteApp programs gets aborted.

Moreover, attempting to create a session collection individually triggers the following error message

> Unable to configure the RD Session Host Server **\<server name>**. Invalid operation

> [!NOTE]
> The Group Policy settings are under the following Group Policy paths:
>
> - `Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Security`
> - `Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Session Host\Licensing`

## Workaround

To work around this issue, apply the Group Policy settings that are mentioned in the [Symptoms](#symptoms) section after you create the Session Collection.

## Status

Microsoft has confirmed that it's a problem in the Microsoft products that are listed in the Applies to section.

## More information

For more information, see [Description of the standard terminology that is used to describe Microsoft software updates](../../windows-client/deployment/standard-terminology-software-updates.md).
