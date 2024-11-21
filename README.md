Detail Instructions: k8s config debug


1. Save the script: Save the script as k8s_config_monitor.sh.

2. Make it executable: Run chmod +x k8s_config_monitor.sh to make it executable.

3. Run the script: Use sudo ./k8s_config_monitor.sh to run it as root.

4. Stop the script: Press [CTRL+C] to stop the monitoring.


==   What this script monitors ==

a. Resource Management: Monitors node and pod resource usage.

b. RBAC: Verifies role-based access control configurations.

c. Networking: Checks pod readiness and service configurations.

d. Cluster Autoscaling: Ensures autoscaling is properly configured.

e. Security Policies: Monitors pod security policies.

f. Storage: Verifies persistent volume (PV) and PVC configurations.

g. Environment Configuration: Ensures consistency between environments.

h. Cluster Upgrade: Verifies if the cluster is up-to-date.

i. Logging and Monitoring: Checks if logging and monitoring are properly set up.

j. Namespace Management: Monitors for misconfigured namespaces.



