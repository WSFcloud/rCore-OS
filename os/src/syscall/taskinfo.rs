use crate::batch::get_current_app_pid;

/// get current task id and name infomation
pub fn sys_get_taskinfo() -> isize{
    let current_app = get_current_app_pid();
    println!("Current app pid: {}", current_app);
	1
}
