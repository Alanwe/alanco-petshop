from pydantic import BaseModel, Field


class WorkItem(BaseModel):
    title: str
    description: str
    status: str = 'todo'
    acceptance_criteria: list[str] = Field(default_factory=list)
