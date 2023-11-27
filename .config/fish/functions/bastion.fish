function bastion --wraps='kubectl exec --stdin --tty -n mini-bastion  -- /bin/sh' --wraps='kubectl exec --stdin --tty -n mini-bastion mini-bastion-57d94659c4-rpzkn -- /bin/sh' --description 'alias bastion=kubectl exec --stdin --tty -n mini-bastion mini-bastion-57d94659c4-rpzkn -- /bin/sh'
  kubectl exec --stdin --tty -n mini-bastion mini-bastion-57d94659c4-rpzkn -- /bin/sh $argv
        
end
