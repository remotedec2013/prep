def exit_if_on_the_master_branch
  exit_if_on_branch('master')
end

def exit_if_on_branch(branch)
  exit_if_branch_condition_fails(lambda{|expression,status|expression =~ status},branch,lambda{|item|  "You cant run this command on the branch #{item}"})
end

def exit_if_not_on_the_branch(branch)
  exit_if_branch_condition_fails(lambda{|expression,status|expression !~ status},branch,lambda{|item| "You need to run this on the branch #{item}"})
end

def exit_if_branch_condition_fails(specification_block,branch,message_block)
  status = `git branch`
  match_expression = %r/\* #{branch}/

  if (specification.call(match_expression,status))
    puts message_block.call(branch)
    exit
  end
end

def run_git_command(command,capture_ouptut = false)
    full_command = "git #{command}"
    if (capture_ouptut)
        `#{full_command}`
    else
        system(full_command)
    end
end

def checkout(branch_name)
  `git checkout -b #{branch_name}`
  `git checkout #{branch_name}`
end


def exit_if_not_on_the_master_branch
  exit_if_not_on_the_branch 'master'
end

def pick_item_from(items,prompt)
  items.each_with_index{|item,index| p "#{index + 1} - #{item}\n"}
  p prompt
  index = gets.chomp.to_i
  return index == 0 ? "": items[index-1]
end
