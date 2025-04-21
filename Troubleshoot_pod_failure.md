1. Check Pod Status
kubectl get pods
Check if the pod is in a Running, Pending, CrashLoopBackOff, or Error state.

2. Describe the Pod
kubectl describe pod <pod-name>

3. Check Pod Logs
kubectl logs <pod-name>
If the pod has multiple containers
kubectl logs <pod-name> -c <container-name>
If a container crashes and restarts,
kubectl logs <pod-name> -c <container-name> --previous

4. Check Pod Events
check for any scheduling or resource-related issues:
kubectl get events --sort-by='.lastTimestamp'

5. Check Resource Usage
facing resource limitations (CPU/Memory), check the resource usage:
kubectl top pod <pod-name>

6. Check Node Status
kubectl describe node <node-name>

7. Check Pod Network Connectivity
kubectl exec -it <pod-name> -- ping <destination-ip-or-hostname>

8. Run Debug Container (If Applicable)
you can run a debug container in the same pod to investigate further:
kubectl run -i --tty --rm debug --image=busybox --pod <pod-name> --restart=Never -- /bin/sh

Check resource quotas
kubectl get resourcequotas

CrashLoopBackOff and ImagepullBackOff issue

kubectl create secret docker-registry <secret-name> \
  --docker-server=<docker-registry-url> \
  --docker-username=<your-docker-username> \
  --docker-password=<your-docker-password> \
  --docker-email=<your-docker-email>