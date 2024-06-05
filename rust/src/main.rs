use std::{env::args, fs::File, io::{BufReader, BufWriter, Error}};
use serde::{Deserialize, Serialize};
use serde_json;

#[derive(Serialize, Deserialize)]
struct TodoItem {
    name: String,
    is_done: bool,
}

fn read_db() -> Option<Vec<TodoItem>> {
    let file = match File::open("db.json") {
        Ok(f) => f,
        Err(_) => {
            write_db(Vec::new()).unwrap();
            File::open("db.json").unwrap()
        }
    };
    let mut reader = BufReader::new(file);

    let result = serde_json::from_reader(&mut reader);
    match result {
        Ok(data) => Some(data),
        Err(_) => Some(Vec::new())
    }
}

fn write_db(data: Vec<TodoItem>) -> Result<Vec<TodoItem>, Error> {
    let file = File::create("db.json").expect("Cannot open file!");
    let mut writer = BufWriter::new(file);
    let result = serde_json::to_writer(&mut writer, &data);

    match result {
        Ok(_) => Ok(data),
        Err(err) => Err(err.into()),
    }
}

fn pprint(todos: &Vec<TodoItem>) {
    for i in 0..(*todos).len() {
        let checkmark = match (*todos)[i].is_done {
            true => "✓",
            false => ""
        };
        println!("{}. {} {}", i+1, (*todos)[i].name, checkmark);
    }
}

fn main() {
    let mut todos: Vec<TodoItem>;
    let command = args().nth(1).unwrap_or_else(|| {
        eprintln!("Usage: todo <command> <arguments>");
        std::process::exit(1);
    });

    match command.as_str() {
        "add" => {
            todos = read_db().unwrap();

            let items = args().skip(2).into_iter();
            for item in items {
                todos.append(&mut vec![TodoItem{name: item, is_done: false}])
            }

            pprint(&todos);

            write_db(todos).unwrap();
        }
        "remove" => {
            todos = read_db().unwrap();

            let arg = args().nth(2).expect("No index is given!");
            let index = arg.parse::<usize>().expect("Argument is not a valid index!");

            todos.remove(index-1);

            pprint(&todos);

            write_db(todos).unwrap();
        }
        "change" => {
            todos = read_db().unwrap();

            let arg = args().nth(2).expect("No index is given!");
            let index = arg.parse::<usize>().expect("Argument is not a valid index!");
            let new_name = args().nth(3).expect("New name is not given!");

            todos[index-1].name = new_name;

            pprint(&todos);

            write_db(todos).unwrap();
        }
        "ls" => {
            todos = read_db().unwrap();

            pprint(&todos);
        }
        "clear" => {
            let empty_vector: Vec<TodoItem> = Vec::new();
            write_db(empty_vector).unwrap();
        }
        "done" => {
            todos = read_db().unwrap();

            let arg = args().nth(2).expect("No index is given!");
            let index = arg.parse::<usize>().expect("Argument is not a valid index!");

            todos[index-1].is_done = true;

            pprint(&todos);

            write_db(todos).unwrap();
        }
        "undone" => {
            todos = read_db().unwrap();

            let arg = args().nth(2).expect("No index is given!");
            let index = arg.parse::<usize>().expect("Argument is not a valid index!");

            todos[index-1].is_done = false;

            pprint(&todos);

            write_db(todos).unwrap();
        }
        _ => {
            eprintln!("Unrecognized command: {}", command);
            std::process::exit(1);
        }
    }
}
